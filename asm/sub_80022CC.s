	.syntax unified
	.set m4aMPlayFadeOut, 0x080D508C + 1
	.set m4aMPlayFadeOutTemporarily, 0x080D509C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80022CC, "ax", %progbits
@ sub_80022CC @ JP 0x080022CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80022CC
	.thumb_func
sub_80022CC:
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080022D6
	movs r4, #6
_080022D6:
	ldr r5, _0800231C @ =0x03000038
	ldr r0, [r5]
	cmp r0, #0
	beq _080022E6
	bl sub_8002DE4
	movs r0, #0
	str r0, [r5]
_080022E6:
	ldr r5, _08002320 @ =0x0300003C
	ldr r0, [r5]
	cmp r0, #0
	beq _080022F6
	bl sub_8002DE4
	movs r0, #0
	str r0, [r5]
_080022F6:
	ldr r0, _08002324 @ =0x03006430
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002328 @ =0x03006640
	adds r1, r4, #0
	bl m4aMPlayFadeOutTemporarily
	ldr r1, _0800232C @ =0x02024E5C
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #1
	strb r0, [r1, #7]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800231C: .4byte 0x03000038
_08002320: .4byte 0x0300003C
_08002324: .4byte 0x03006430
_08002328: .4byte 0x03006640
_0800232C: .4byte 0x02024E5C

