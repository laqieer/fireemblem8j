	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_8080458, "ax", %progbits
@ sub_8080458 @ JP 0x08080458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080458
	.thumb_func
sub_8080458:
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl sub_8014B50
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8080CB8
	ldr r0, _080804A8 @ =0x086B3B5C
	ldr r1, _080804AC @ =0x06013800
	bl sub_8013008
	ldr r0, _080804B0 @ =0x086B3D44
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080804B4 @ =0x08A22098
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	subs r2, #0x10
	ldr r3, _080804B8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8009608
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080804A8: .4byte 0x086B3B5C
_080804AC: .4byte 0x06013800
_080804B0: .4byte 0x086B3D44
_080804B4: .4byte 0x08A22098
_080804B8: .4byte 0x000041C0

