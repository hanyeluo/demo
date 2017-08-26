<?php

namespace App\Http\Controllers;

use App\Offer;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Vinkla\Alert\Facades\Alert;

class OfferController extends Controller
{
    public function index() {
        $user = Auth::user();
        $offers = $user->offers;
        return view('offer.index')->with(compact('offers'));
    }

    public function create() {
        return view('offer.create');
    }

    public function store(Request $request) {
        $payload = $request->all();
        $user = Auth::user();
        $payload['sort'] = 0;
        try {
            $user->offers()->create($payload);
        }catch (Exception $exception) {
            Alert::danger('创建招聘信息失败');
            return redirect()->back();
        }
        return redirect('/offers');
    }

    public function destroy(Offer $offer) {
        try {
            $offer->delete();
        }catch (Exception $exception) {
            Alert::danger('删除招聘信息失败');
            return redirect()->back();
        }
        return redirect('/offers');
    }

    public function edit(Offer $offer) {
        return view('offer.edit')->with(compact('offer'));
    }

    public function update(Request $request, Offer $offer) {
        try {
            $offer->update($request->all());
        }catch (Exception $exception) {
            Alert::danger('更新招聘信息失败');
            return redirect()->back();
        }
        Alert::success('更新招聘信息成功');
        return redirect()->back();
    }
}
