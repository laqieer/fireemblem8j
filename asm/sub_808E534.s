	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.section .text.sub_808E534, "ax", %progbits
@ sub_808E534 @ JP 0x0808E534 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E534
	.thumb_func
sub_808E534:
	push {lr}
	ldr r1, _0808E57C @ =0x08A738E0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge _0808E550
	movs r2, #0
_0808E550:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge _0808E55C
	movs r1, #0
_0808E55C:
	ldr r0, _0808E580 @ =0x02003D2C
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _0808E584 @ =0x02022CA8
	adds r1, r1, r2
	movs r2, #0xd
	movs r3, #6
	bl j_TmCopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808E57C: .4byte 0x08A738E0
_0808E580: .4byte 0x02003D2C
_0808E584: .4byte 0x02022CA8

