	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_80258B4, 0x080258B4 + 1
	.section .text.sub_8035F20, "ax", %progbits
@ sub_8035F20 @ JP 0x08035F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035F20
	.thumb_func
sub_8035F20:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08035F3C @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	bl sub_80258B4
	bl GetSelectTargetCount
	cmp r0, #0
	bne _08035F40
	adds r0, r4, #0
	bl Proc_End
	b _08035F48
	.align 2, 0
_08035F3C: .4byte 0x0202BCEC
_08035F40:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08035F48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

