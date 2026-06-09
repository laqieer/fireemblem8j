	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_808EBE8, "ax", %progbits
@ sub_808EBE8 @ JP 0x0808EBE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EBE8
	.thumb_func
sub_808EBE8:
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x3e]
	movs r0, #0xa1
	lsls r0, r0, #3
	cmp r1, r0
	bne _0808EC52
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0808EC58 @ =0x02022CA8
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x3f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0808EC5C @ =0x020234A8
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl j_TmFillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
_0808EC52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC58: .4byte 0x02022CA8
_0808EC5C: .4byte 0x020234A8

