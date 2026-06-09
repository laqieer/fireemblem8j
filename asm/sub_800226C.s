	.syntax unified
	.set m4aMPlayFadeOut, 0x080D508C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_800226C, "ax", %progbits
@ sub_800226C @ JP 0x0800226C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800226C
	.thumb_func
sub_800226C:
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _08002276
	movs r4, #6
_08002276:
	ldr r5, _080022B8 @ =0x03000038
	ldr r0, [r5]
	cmp r0, #0
	beq _08002286
	bl sub_8002DE4
	movs r0, #0
	str r0, [r5]
_08002286:
	ldr r5, _080022BC @ =0x0300003C
	ldr r0, [r5]
	cmp r0, #0
	beq _08002296
	bl sub_8002DE4
	movs r0, #0
	str r0, [r5]
_08002296:
	ldr r0, _080022C0 @ =0x03006430
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _080022C4 @ =0x03006640
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r1, _080022C8 @ =0x02024E5C
	movs r0, #0
	strb r0, [r1, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080022B8: .4byte 0x03000038
_080022BC: .4byte 0x0300003C
_080022C0: .4byte 0x03006430
_080022C4: .4byte 0x03006640
_080022C8: .4byte 0x02024E5C

