	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_800223C, 0x0800223C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.StartBgmVolumeChange, "ax", %progbits
@ StartBgmVolumeChange @ JP 0x08002680 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartBgmVolumeChange
	.thumb_func
StartBgmVolumeChange:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	beq _0800269C
	ldr r0, _08002698 @ =0x08577620
	bl Proc_StartBlocking
	b _080026A4
	.align 2, 0
_08002698: .4byte 0x08577620
_0800269C:
	ldr r0, _080026D0 @ =0x08577620
	movs r1, #3
	bl sub_8002BCC
_080026A4:
	adds r4, r0, #0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r7, [r0]
	cmp r5, #0
	bne _080026C0
	movs r5, #1
_080026C0:
	adds r0, r5, #0
	bl sub_800223C
	ldr r0, _080026D4 @ =0x0300003C
	str r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080026D0: .4byte 0x08577620
_080026D4: .4byte 0x0300003C

