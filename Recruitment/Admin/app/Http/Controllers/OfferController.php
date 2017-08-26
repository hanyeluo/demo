<?php

namespace App\Http\Controllers;

use App\Offer;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Vinkla\Alert\Facades\Alert;
use Carbon\Carbon;
class OfferController extends Controller
{
    public function index()
    {
        $offers = Offer::orderBy('created_at', 'desc')->paginate(10);
        return view('offer.index')->with(compact('offers'));
    }

    public function edit(Offer $offer) {
        return view('offer.edit')->with(compact('offer'));
    }

    public function top(Request $request, Offer $offer) {
        $offer->created_at = Carbon::now();
        try {
            $offer->save();
        }catch (Exception $exception) {
            Alert::danger('更新招聘置顶信息失败');
            return redirect()->back();
        }
        Alert::success('更新招聘置顶信息成功');
        return redirect()->back();
    }

    public function update(Request $request, Offer $offer) {
        try {
            $offer->update($request->all());
        }catch (Exception $exception) {
            Alert::danger('更新招聘置顶信息失败');
            return redirect()->back();
        }
        Alert::success('更新招聘置顶信息成功');
        return redirect()->back();
    }

    public function enable(Offer $offer) {
        $offer->status = 1;
        try {
            $offer->save();
        }catch (Exception $exception) {
            Alert::danger('启用失败');
            return redirect()->back();
        }

        Alert::success('启用成功');
        return redirect()->back();
    }

    public function disable(Offer $offer) {
        $offer->status = 0;
        try {
            $offer->save();
        }catch (Exception $exception) {
            Alert::danger('禁用失败');
            return redirect()->back();
        }

        Alert::success('禁用成功');
        return redirect()->back();
    }
}
