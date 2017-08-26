<?php

namespace App\Http\Controllers;

use App\Offer;
use App\Resume;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ResumeController extends Controller
{
    public function index(Offer $offer) {

        $resumes = $offer->resumes;
        return view('resume.index')->with(compact('resumes'));
    }

    public function detail(Resume $resume) {
        return view('resume.detail')->with(compact('resume'));
    }
}
