<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BookController extends Controller
{
    private $rules = [
        'isbn' => 'required|string|max:50|min:3',
        'title' => 'required|string|max:50|min:3',
        'author' => 'required|string|max:50|min:3',
        'editorial_id' => 'required|numeric|max:99999999999999999999',
        'category_id' => 'required|numeric|max:99999999999999999999',
    ];

    private $traductionAttributes = [
        'isbn' => 'ISBN',
        'title' => 'título',
        'author' => 'autor',
        'editorial_id' => 'editorial',
        'category_id' => 'categoría',
    ];
    
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $books = Book::all();
        $books->load(['category', 'editorial']);
        return response()->json($books, Response::HTTP_OK);
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

        $book = Book::create($request->all());
        $response = [
            'message' => 'Registro creado exitosamente',
            'book' => $book
        ];

        return response()->json($response, Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     */
    public function show(Book $book)
    {
        $book->load(['category', 'editorial']);
        return response()->json($book, Response::HTTP_OK);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Book $book)
    {
        $data = $this->applyValidator($request, $this->rules, $this->traductionAttributes);
        if(!empty($data))
        {
            return $data;
        }

        $book->update($request->all());
        $response = [
            'message' => 'Registro actualizado exitosamente',
            'book' => $book
        ];

        return response()->json($response, Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Book $book)
    {
        $book->delete();
        $response = [
            'message' => 'Registro eliminado exitosamente',
            'book' => $book
        ];

        return response()->json($response, Response::HTTP_OK);
    }
}
