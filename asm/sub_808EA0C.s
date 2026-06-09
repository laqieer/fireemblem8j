	.syntax unified
	.set GetCursorQuadrant, 0x0808DEDC + 1
	.section .text.sub_808EA0C, "ax", %progbits
@ sub_808EA0C @ JP 0x0808EA0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EA0C
	.thumb_func
sub_808EA0C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetCursorQuadrant
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble _0808EA30
	cmp r4, #0xb
	bgt _0808EA32
	ldr r0, _0808EA48 @ =0x08A738E0
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808EA32
_0808EA30:
	movs r2, #4
_0808EA32:
	cmp r5, #1
	bgt _0808EA38
	subs r2, #1
_0808EA38:
	cmp r5, #0x16
	ble _0808EA3E
	adds r2, #1
_0808EA3E:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808EA48: .4byte 0x08A738E0

