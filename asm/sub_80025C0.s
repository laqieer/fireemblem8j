	.syntax unified
	.set m4aMPlayFadeIn, 0x080D50BC + 1
	.set m4aMPlayFadeOut, 0x080D508C + 1
	.section .text.sub_80025C0, "ax", %progbits
@ sub_80025C0 @ JP 0x080025C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80025C0
	.thumb_func
sub_80025C0:
	push {r4, r5, lr}
	ldr r0, _080025FC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r5, r0, #0x1f
	cmp r5, #0
	bne _080025F4
	ldr r4, _08002600 @ =0x02024E5C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _080025F4
	ldr r0, _08002604 @ =0x03006430
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _08002608 @ =0x03006640
	movs r1, #6
	bl m4aMPlayFadeIn
	movs r0, #1
	strb r0, [r4, #6]
	strb r5, [r4, #7]
	ldrh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r5, [r4, #2]
_080025F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080025FC: .4byte 0x0202BCEC
_08002600: .4byte 0x02024E5C
_08002604: .4byte 0x03006430
_08002608: .4byte 0x03006640

