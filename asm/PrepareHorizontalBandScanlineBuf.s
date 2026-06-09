	.syntax unified
	.section .text.PrepareHorizontalBandScanlineBuf, "ax", %progbits
@ PrepareHorizontalBandScanlineBuf @ JP 0x08084928 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepareHorizontalBandScanlineBuf
	.thumb_func
PrepareHorizontalBandScanlineBuf:
	push {r4, r5, lr}
	ldr r0, _08084980 @ =0x0203E750
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldr r0, [r0]
	movs r2, #0x9f
_08084936:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _08084936
	ldr r0, _08084980 @ =0x0203E750
	ldr r0, [r0]
	movs r1, #0x10
	adds r0, #0x10
	movs r2, #0x8f
_0808494A:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0808494A
	movs r2, #0
	ldr r0, _08084980 @ =0x0203E750
	ldr r0, [r0]
	movs r5, #0x10
	movs r1, #0x98
	lsls r1, r1, #1
	adds r4, r0, r1
	adds r3, r0, #0
_08084964:
	asrs r1, r2, #1
	subs r0, r5, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3, #0x10]
	strh r0, [r4]
	subs r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, #0x20
	ble _08084964
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084980: .4byte 0x0203E750

