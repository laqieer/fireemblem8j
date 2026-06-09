	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.section .text.sub_808E588, "ax", %progbits
@ sub_808E588 @ JP 0x0808E588 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E588
	.thumb_func
sub_808E588:
	push {lr}
	ldr r1, _0808E5C0 @ =0x08A738E0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	cmp r0, #0
	bge _0808E5A6
	movs r1, #0
_0808E5A6:
	ldr r0, _0808E5C4 @ =0x02003FAC
	lsls r1, r1, #1
	ldr r2, _0808E5C8 @ =0x02022FE8
	adds r1, r1, r2
	movs r2, #7
	movs r3, #7
	bl j_TmCopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808E5C0: .4byte 0x08A738E0
_0808E5C4: .4byte 0x02003FAC
_0808E5C8: .4byte 0x02022FE8

