	.syntax unified
	.set m4aMPlayFadeIn, 0x080D50BC + 1
	.set m4aMPlayFadeOut, 0x080D508C + 1
	.section .text.sub_800260C, "ax", %progbits
@ sub_800260C @ JP 0x0800260C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800260C
	.thumb_func
sub_800260C:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0800264C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r5, r0, #0x1f
	cmp r5, #0
	bne _08002644
	ldr r4, _08002650 @ =0x02024E5C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _08002644
	ldr r0, _08002654 @ =0x03006430
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _08002658 @ =0x03006640
	adds r1, r6, #0
	bl m4aMPlayFadeIn
	movs r0, #1
	strb r0, [r4, #6]
	strb r5, [r4, #7]
	ldrh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r5, [r4, #2]
_08002644:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800264C: .4byte 0x0202BCEC
_08002650: .4byte 0x02024E5C
_08002654: .4byte 0x03006430
_08002658: .4byte 0x03006640

