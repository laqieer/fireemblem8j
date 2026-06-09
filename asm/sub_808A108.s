	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_808A108, "ax", %progbits
@ sub_808A108 @ JP 0x0808A108 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A108
	.thumb_func
sub_808A108:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0808A13C @ =0x08A7291C
	bl Proc_StartBlocking
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	adds r2, r0, #0
	adds r2, #0x4a
	strh r1, [r2]
	str r5, [r0, #0x38]
	ldr r0, _0808A140 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A134
	movs r0, #0xc8
	bl m4aSongNumStart
_0808A134:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A13C: .4byte 0x08A7291C
_0808A140: .4byte 0x0202BCEC

