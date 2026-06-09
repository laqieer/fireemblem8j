	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set MapUnitC_GetDisplayedClass, 0x080BFFC4 + 1
	.set sub_807AC60, 0x0807AC60 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80C3248, "ax", %progbits
@ sub_80C3248 @ JP 0x080C3248 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3248
	.thumb_func
sub_80C3248:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_GetDisplayedClass
	adds r4, r0, #0
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080C3298
	cmp r4, #0x1f
	blt _080C3290
	cmp r4, #0x24
	ble _080C3288
	cmp r4, #0x49
	bgt _080C3290
	cmp r4, #0x48
	blt _080C3290
	ldr r4, _080C3284 @ =0x08AC1D7A
	b _080C32D2
	.align 2, 0
_080C3284: .4byte 0x08AC1D7A
_080C3288:
	ldr r4, _080C328C @ =0x08AC1D4E
	b _080C32D2
	.align 2, 0
_080C328C: .4byte 0x08AC1D4E
_080C3290:
	ldr r4, _080C3294 @ =0x08AC1D20
	b _080C32D2
	.align 2, 0
_080C3294: .4byte 0x08AC1D20
_080C3298:
	cmp r4, #0x65
	beq _080C32C0
	cmp r4, #0x65
	bgt _080C32B8
	cmp r4, #0x3c
	bgt _080C32B2
	cmp r4, #0x3b
	bge _080C32C0
	cmp r4, #0xc
	bgt _080C32D0
	cmp r4, #9
	blt _080C32D0
	b _080C32C0
_080C32B2:
	cmp r4, #0x50
	beq _080C32C8
	b _080C32D0
_080C32B8:
	cmp r4, #0x69
	bgt _080C32D0
	cmp r4, #0x67
	blt _080C32D0
_080C32C0:
	ldr r4, _080C32C4 @ =0x08AC1CDC
	b _080C32D2
	.align 2, 0
_080C32C4: .4byte 0x08AC1CDC
_080C32C8:
	ldr r4, _080C32CC @ =0x08AC1DD2
	b _080C32D2
	.align 2, 0
_080C32CC: .4byte 0x08AC1DD2
_080C32D0:
	ldr r4, _080C3314 @ =0x08AC1CB8
_080C32D2:
	adds r2, r6, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	bl sub_80D637C
	ldr r1, _080C3318 @ =0xFFFF0000
	ands r5, r1
	movs r1, #0x78
	orrs r5, r1
	ldr r1, _080C331C @ =0x0000FFFF
	ands r5, r1
	movs r1, #0xa0
	lsls r1, r1, #0xf
	orrs r5, r1
	lsls r0, r0, #1
	adds r1, r0, r4
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _080C330C
	ldrh r1, [r4, #2]
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	bl sub_807AC60
_080C330C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3314: .4byte 0x08AC1CB8
_080C3318: .4byte 0xFFFF0000
_080C331C: .4byte 0x0000FFFF

