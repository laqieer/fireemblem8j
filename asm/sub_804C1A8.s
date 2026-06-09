	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_804A14C, 0x0804A14C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_804C1A8, "ax", %progbits
@ sub_804C1A8 @ JP 0x0804C1A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C1A8
	.thumb_func
sub_804C1A8:
	push {lr}
	ldr r2, _0804C1BC @ =0x0203DD8C
	ldrb r1, [r2, #8]
	cmp r1, #0
	bne _0804C1C0
	strb r1, [r2, #9]
	movs r1, #0
	bl Proc_Goto
	b _0804C1D2
	.align 2, 0
_0804C1BC: .4byte 0x0203DD8C
_0804C1C0:
	bl sub_807B4B8
	ldr r0, _0804C1D8 @ =0x0202BCEC
	ldrb r1, [r0, #0xf]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl sub_804A14C
_0804C1D2:
	pop {r0}
	bx r0
	.align 2, 0
_0804C1D8: .4byte 0x0202BCEC

