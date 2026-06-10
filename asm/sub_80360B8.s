	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_802599C, 0x0802599C + 1
	.set sub_80263B8, 0x080263B8 + 1
	.section .text.sub_80360B8, "ax", %progbits
@ sub_80360B8 @ JP 0x080360B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80360B8
	.thumb_func
sub_80360B8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080360DC @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	bl sub_802599C
	movs r0, #4
	bl sub_80263B8
	bl GetSelectTargetCount
	cmp r0, #0
	bne _080360E0
	adds r0, r4, #0
	bl Proc_End
	b _080360E8
	.align 2, 0
_080360DC: .4byte 0x0202BCEC
_080360E0:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_080360E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

