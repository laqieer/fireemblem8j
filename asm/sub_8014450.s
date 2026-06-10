	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_8014450, "ax", %progbits
@ sub_8014450 @ JP 0x08014450 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014450
	.thumb_func
sub_8014450:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, _08014490 @ =0x030007F8
	adds r0, r5, #0
	bl sub_8003E0C
	adds r1, r0, #7
	cmp r1, #0
	bge _08014468
	adds r1, #7
_08014468:
	asrs r1, r1, #3
	adds r0, r4, #0
	bl InitText
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8003D90
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003F28
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014490: .4byte 0x030007F8

