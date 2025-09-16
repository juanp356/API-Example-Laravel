<?php

namespace App\Http\Controllers;

use App\Models\Editorial;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class EditorialController extends Controller
{
    private $rules = [
        'name' => 'required|string|max:50|min:3',
        'address' => 'string|max:80|min:3',
    ];

    private $traductionAttributes = [
        'name' => 'nombre',
        'address' => 'dirección',
    ];
    
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $editorials = Editorial::all();
        return response()->json($editorials, Response::HTTP_OK);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $this->applyValidator($request, $this->rules, $this->traductionAttributes);
        if(!empty($data))
        {
            return $data;
        }

        $editorial = Editorial::create($request->all());
        $response = [
            'message' => 'Registro creado exitosamente',
            'editorial' => $editorial
        ];

        return response()->json($response, Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     */
    public function show(Editorial $editorial)
    {
        return response()->json($editorial, Response::HTTP_OK);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Editorial $editorial)
    {
        $data = $this->applyValidator($request, $this->rules, $this->traductionAttributes);
        if(!empty($data))
        {
            return $data;
        }

        $editorial->update($request->all());
        $response = [
            'message' => 'Registro actualizado exitosamente',
            'editorial' => $editorial
        ];

        return response()->json($response, Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Editorial $editorial)
    {
        $editorial->delete();
        $response = [
            'message' => 'Registro eliminado exitosamente',
            'editorial' => $editorial
        ];

        return response()->json($response, Response::HTTP_OK);
    }
}
