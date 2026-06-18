	.syntax unified
	.section .text.sub_808DF74, "ax", %progbits
@ GetHpBarRightTile @ JP 0x0808DF74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetHpBarRightTile
	.thumb_func
GetHpBarRightTile:
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _0808DF82
	movs r1, #5
_0808DF82:
	cmp r1, #0
	bge _0808DF88
	movs r1, #0
_0808DF88:
	adds r0, r2, #0
	adds r0, #0xf
	adds r0, r1, r0
	strh r0, [r3]
	pop {r0}
	bx r0

