	.syntax unified
	.set StartItemHelpBox, 0x0808B0EC + 1
	.section .text.sub_8024538, "ax", %progbits
@ sub_8024538 @ JP 0x08024538 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024538
	.thumb_func
sub_8024538:
	push {r4, lr}
	adds r4, r1, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _08024564
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _08024560 @ =0x0202BCAC
	ldrh r2, [r2, #0x2c]
	bl StartItemHelpBox
	movs r0, #0
	b _08024584
	.align 2, 0
_08024560: .4byte 0x0202BCAC
_08024564:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _0802458C @ =0x03004DF0
	ldr r3, [r2]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r3, #0x1e
	adds r3, r3, r2
	ldrh r2, [r3]
	bl StartItemHelpBox
_08024584:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802458C: .4byte 0x03004DF0

