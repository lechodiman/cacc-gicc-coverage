# AC03 Luis Chodiman

## _Correlated Active Clause Coverage_

Los predicados son:

- _p1_ = `ingredients.include?('Tomato') && ingredients.include?('Cheese')`

- _p2_ = `ingredients.include?('Tomato') && ingredients.include?('Cheese') && (ingredients.include?('Ham') || ingredients.include?('Olives'))`

- _p3_ = `!(ingredients.include?('Cheese') || ingredients.include?('Extra cheese'))`

Las cláusulas son:

- _a_ = `ingredients.include?('Tomato')`

- _b_ = `ingredients.include?('Cheese')`

- _c_ = `ingredients.include?('Ham')`

- _d_ = `ingredients.include?('Olives'))`

- _e_ = `ingredients.include?('Extra cheese')`

Los requisitos son que para cada predicado y para cada cláusula mayor en ese predicado, se tenga que cada cláusula mayor determine el predicado con la restricción de que para un valor de la cláusula mayor el predicado sea verdadero y falso para el otro.

### Primer predicado

El primer predicado es de la forma:

- _p1_ = `a && b`

#### Cláusula activa: a

Para que el valor del predicado dependa de la cláusula `a` se debe tener que `b` sea _T_ . Por ejemplo, se tienen los siguientes _TRs_:

| _TR#_ | _a_   | _b_ | _p1_  |
| ----- | ----- | --- | ----- |
| 1     | **T** | T   | **T** |
| 2     | **F** | T   | **F** |

#### Cláusula activa: b

Con respecto a `b`, `a` debe ser _T_:

| _TR#_ | _a_   | _b_ | _p1_  |
| ----- | ----- | --- | ----- |
| 3     | **T** | T   | **T** |
| 4     | **T** | F   | **F** |

#### Resumen primer predicado

Por lo tanto, combinando estos requisitos en casos de tests nos queda:

| _TC#_ | _a_ | _b_ | _TR_ cubiertos |
| ----- | --- | --- | -------------- |
| 1     | T   | T   | 1, 3           |
| 2     | F   | T   | 2              |
| 3     | T   | F   | 4              |

### Segundo predicado

Con respecto al segundo predicado, se realiza el trabajo de manera similar. Se tiene la siguiente forma:

- _p2_ = `a && b && (c || d)`

#### Cláusula activa: a

De la misma forma que en el predicado anterior, debemos buscar la combinación de `b`, `c` y `d` para que el predicado dependa de `a`. En este caso, para que el predicado dependa de `a`, `b` debe ser _T_ y `c` o `d` deben ser _T_. Por lo tanto, se pueden tener las combinaciones:

| _TR#_ | _a_   | _b_ | _c_ | _d_ | _p2_  |
| ----- | ----- | --- | --- | --- | ----- |
| 5     | **T** | T   | T   | T   | **T** |
| 6     | **F** | T   | T   | T   | **F** |

#### Cláusula activa: b

Análogamente:

| _TR#_ | _a_ | _b_   | _c_ | _d_ | _p2_  |
| ----- | --- | ----- | --- | --- | ----- |
| 7     | T   | **T** | T   | T   | **T** |
| 8     | T   | **F** | T   | T   | **F** |

#### Cláusula activa: c

| _TR#_ | _a_ | _b_ | _c_   | _d_ | _p2_  |
| ----- | --- | --- | ----- | --- | ----- |
| 9     | T   | T   | **T** | F   | **T** |
| 10    | T   | T   | **F** | F   | **F** |

#### Cláusula activa: d

Análogo al caso de c:

| _TR#_ | _a_ | _b_ | _c_ | _d_   | _p2_  |
| ----- | --- | --- | --- | ----- | ----- |
| 11    | T   | T   | F   | **T** | **T** |
| 12    | T   | T   | F   | **F** | **F** |

### Resumen primer y segundo predicado

Combinando estos requisitos con los anteriores, nuestra tabla de casos de prueba va creciendo:

| _TC#_ | _a_ | _b_ | _c_ | _d_ | _TR_ cubiertos |
| ----- | --- | --- | --- | --- | -------------- |
| 1     | T   | T   | T   | T   | 1, 3, 5, 7     |
| 2     | F   | T   | T   | T   | 2, 6           |
| 3     | F   | F   | T   | T   | 4, 8           |
| 4     | T   | T   | T   | F   | 9              |
| 5     | T   | T   | F   | F   | 10, 12         |
| 6     | T   | T   | F   | T   | 11             |

### Tercer predicado

El siguiente predicado es de la forma:

- _p3_ = `!(b || e)`

#### Cláusula b

Para que el predicado dependa a `b`, `e` debe ser _F_:

| _TR#_ | _b_   | _e_ | _p3_  |
| ----- | ----- | --- | ----- |
| 13    | **T** | F   | **F** |
| 14    | **F** | F   | **T** |

#### Cláusula e

Para que el predicado dependa de `e`, `b` debe ser _F_:

| _TR#_ | _b_ | _e_   | _p3_  |
| ----- | --- | ----- | ----- |
| 15    | F   | **T** | **F** |
| 16    | F   | **F** | **T** |

### Resumen primer, segundo y tercer predicado

Combinando estos requisitos con los anteriores, nuestra tabla de casos de prueba va creciendo:

| _TC#_ | _a_ | _b_ | _c_ | _d_ | _e_ | _TR_ cubiertos |
| ----- | --- | --- | --- | --- | --- | -------------- |
| 1     | T   | T   | T   | T   | F   | 1, 3, 5, 7, 13 |
| 2     | F   | T   | T   | T   | -   | 2, 6           |
| 3     | F   | F   | T   | T   | F   | 4, 8, 14       |
| 4     | T   | T   | T   | F   | -   | 9              |
| 5     | T   | T   | F   | F   | -   | 10, 12         |
| 6     | T   | T   | F   | T   | -   | 11             |
| 7     | -   | F   | -   | -   | T   | 15             |
| 8     | -   | F   | -   | -   | F   | 16             |

Con esto tenemos el _coverage_ completo por lo que podemos dejar cualquier valor para los "-". En este ejemplo, completaré con los mismas combinaciones existentes.

## Casos de prueba

Combinando todos los requisitos, nuestra tabla de casos de prueba queda como:

| _TC#_ | _a_ | _b_ | _c_ | _d_ | _e_ | _TR_ cubiertos | input                                   | output                             |
| ----- | --- | --- | --- | --- | --- | -------------- | --------------------------------------- | ---------------------------------- |
| 1     | T   | T   | T   | T   | F   | 1, 3, 5, 7, 13 | `["Tomato", "Cheese", "Ham", "Olives"]` | Neapolitan Classic                 |
| 2     | F   | T   | T   | T   | F   | 2, 6           | `["Cheese", "Ham", "Olives"]`           | Pizza From da house                |
| 3     | F   | F   | T   | T   | F   | 4, 8, 14       | `["Ham", "Olives"]`                     | Pizza From da house Without Cheese |
| 4     | T   | T   | T   | F   | F   | 9              | `["Tomato", "Cheese", "Ham"]`           | Neapolitan Classic                 |
| 5     | T   | T   | F   | F   | F   | 10, 12         | `["Tomato", "Cheese"]`                  | Classic From da house              |
| 6     | T   | T   | F   | T   | F   | 11             | `["Tomato", "Cheese", "Olives"]`        | Neapolitan Classic                 |
| 7     | F   | F   | F   | F   | T   | 15             | `["Extra cheese"]`                      | Pizza From da house                |
| 8     | F   | F   | F   | F   | F   | 16             | `[]`                                    | Pizza From da house Without Cheese |

## _General Inactive Clause Coverage_

Ahora, hay que escoger las cláusulas menores de modo que la cláusula mayor **no** determine p. Ade,ás, se exigen 4 TR por cada cláusula mayor analizada. No obstante, hay varios casos en los cuales no se puede lograr cumplir los 4 TR debido a que no hay suficientes valores para las cláusulas menores que logren que la cláusula mayor no determine a p y además P tome los valores que debería tomar.

Los predicados y cláusulas son los mismos que para el criterio anterior.

### Primer predicado

#### Cláusula activa: a

Para que `a` no determine `p1`, `b` debe ser **F**. Dado que si es **T**, entonces `a` determinaría `p1`

| _TR#_ | _a_   | _b_ | _p1_  |
| ----- | ----- | --- | ----- |
| 1     | **T** | F   | **F** |
| 2     | **F** | F   | **F** |
| 3?    | ?     | F   | **T** |
| 4?    | ?     | F   | **T** |

Como el único valor de `b` para que `a` no determine `p1` es **F**, no hay combinaciones de valores suficientes para lograr los 4 TR. Por ende, los casos 3?, y 4? se eliminarán.

#### Cláusula activa: b

Similar a `a`, no hay valores suficientes para `a`.

| _TR#_ | _a_ | _b_   | _p1_  |
| ----- | --- | ----- | ----- |
| 3     | F   | **T** | **F** |
| 4     | F   | **F** | **F** |
| 5?    | ?   | F     | **T** |
| 6?    | ?   | F     | **T** |

### Segundo predicado

#### Cláusula activa: a

Similar a los casos anteriores, no hay caso en que `p2` sea **T**, sin que `a` sea **T**.

| _TR#_ | _a_   | _b_ | _c_ | _d_ | _p2_  |
| ----- | ----- | --- | --- | --- | ----- |
| 5     | **T** | F   | F   | F   | **F** |
| 6     | **F** | F   | F   | F   | **F** |

#### Cláusula activa: b

Tampoco se puede, por la razón análoga a `a`:

| _TR#_ | _a_ | _b_   | _c_ | _d_ | _p2_  |
| ----- | --- | ----- | --- | --- | ----- |
| 7     | F   | **T** | F   | F   | **F** |
| 8     | F   | **F** | F   | F   | **F** |

#### Cláusula activa: c

Acá sí se puede:

| _TR#_ | _a_ | _b_ | _c_   | _d_ | _p2_  |
| ----- | --- | --- | ----- | --- | ----- |
| 9     | F   | F   | **T** | F   | **F** |
| 10    | F   | F   | **F** | F   | **F** |
| 11    | T   | T   | **T** | T   | **T** |
| 12    | T   | T   | **F** | T   | **T** |

#### Cláusula activa: d

Similar al caso anterior, pero con los valores de las columnas cambiadas de orden:

| _TR#_ | _a_ | _b_ | _c_ | _d_   | _p2_  |
| ----- | --- | --- | --- | ----- | ----- |
| 13    | F   | F   | F   | **T** | **F** |
| 14    | F   | F   | F   | **F** | **F** |
| 15    | T   | T   | T   | **T** | **T** |
| 16    | T   | T   | T   | **F** | **T** |

### Tercer predicado

#### Cláusula activa: b

Tampoco se pueden obtener los 4 TR, sólo 2:

| _TR#_ | _b_   | _e_ | _p3_  |
| ----- | ----- | --- | ----- |
| 17    | **T** | T   | **F** |
| 18    | **F** | T   | **F** |

#### Cláusula activa: e

Tampoco se pueden obtener los 4 TR, sólo 2:

| _TR#_ | _b_ | _e_   | _p3_  |
| ----- | --- | ----- | ----- |
| 19    | T   | **T** | **F** |
| 20    | T   | **F** | **F** |

### Resumen primer, segundo y tercer predicado

Combinando estos requisitos con los anteriores, nuestra tabla de casos de prueba queda:

| _TC#_ | _a_ | _b_ | _c_ | _d_ | _e_ | _TR_ cubiertos     |
| ----- | --- | --- | --- | --- | --- | ------------------ |
| 1     | T   | F   | F   | F   | -   | 1, 5               |
| 2     | F   | F   | F   | F   | T   | 2, 4, 6, 8, 10, 14 |
| 3     | F   | T   | F   | F   | T   | 3, 7, 17           |
| 4     | F   | F   | F   | F   | -   | 9                  |
| 5     | T   | T   | F   | T   | T   | 11, 15, 19         |
| 6     | T   | T   | T   | T   | F   | 12, 20             |
| 7     | F   | F   | T   | T   | -   | 13                 |
| 8     | T   | T   | F   | F   | -   | 16                 |

Con esto tenemos el _coverage_ completo por lo que podemos dejar cualquier valor para los "-". En este ejemplo, completaré con los mismas combinaciones existentes.

## Casos de prueba

Combinando todos los requisitos, nuestra tabla de casos de prueba queda como:

| _TC#_ | _a_ | _b_ | _c_ | _d_ | _e_ | _TR_ cubiertos     | ingredientes                                     | output                             |
| ----- | --- | --- | --- | --- | --- | ------------------ | ------------------------------------------------ | ---------------------------------- |
| 1     | T   | F   | F   | F   | F   | 1, 5               | `["Tomato"]`                                     | Pizza From da house Without Cheese |
| 2     | F   | F   | F   | F   | T   | 2, 4, 6, 8, 10, 14 | `["Extra cheese"]`                               | Pizza From da house                |
| 3     | F   | T   | F   | F   | T   | 3, 7, 17           | `["Cheese", "Extra cheese"]`                     | Pizza From da house                |
| 4     | F   | F   | F   | F   | F   | 9                  | `[]`                                             | Pizza From da house Without Cheese |
| 5     | T   | T   | F   | T   | T   | 11, 15, 19         | `["Tomato", "Cheese", "Olives", "Extra cheese"]` | Neapolitan Classic                 |
| 6     | T   | T   | T   | T   | F   | 12, 20             | `["Tomato", "Cheese", "Ham", "Olives"]`          | Neapolitan Classic                 |
| 7     | F   | F   | T   | T   | F   | 13                 | `["Ham", "Olives"]`                              | Pizza From da house Without Cheese |
| 8     | T   | T   | F   | F   | F   | 16                 | `["Tomato", "Cheese"]`                           | Classic From da house              |
