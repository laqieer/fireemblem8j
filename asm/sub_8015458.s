	.syntax unified
	.set Eventinfo_CondFalse_3, 0x08085608 + 1
	.set Eventinfo_CondFalse_4, 0x0808560C + 1
	.section .text.sub_8015458, "ax", %progbits
@ sub_8015458 @ JP 0x08015458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015458
	.thumb_func
sub_8015458:
	push {lr}
	bl Eventinfo_CondFalse_4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0801546A
	movs r0, #1
	b _08015470
_0801546A:
	bl Eventinfo_CondFalse_3
	movs r0, #0
_08015470:
	pop {r1}
	bx r1

