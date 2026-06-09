	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_804A14C, 0x0804A14C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_804C170, "ax", %progbits
@ sub_804C170 @ JP 0x0804C170 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C170
	.thumb_func
sub_804C170:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804C188 @ =0x0203DD8C
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0804C18C
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _0804C19E
	.align 2, 0
_0804C188: .4byte 0x0203DD8C
_0804C18C:
	bl sub_807B4B8
	ldr r0, _0804C1A4 @ =0x0202BCEC
	ldrb r1, [r0, #0xf]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl sub_804A14C
_0804C19E:
	pop {r0}
	bx r0
	.align 2, 0
_0804C1A4: .4byte 0x0202BCEC

