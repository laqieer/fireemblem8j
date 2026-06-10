	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8025A14, 0x08025A14 + 1
	.section .text.sub_80361B8, "ax", %progbits
@ sub_80361B8 @ JP 0x080361B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80361B8
	.thumb_func
sub_80361B8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080361D4 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	bl sub_8025A14
	bl GetSelectTargetCount
	cmp r0, #0
	bne _080361D8
	adds r0, r4, #0
	bl Proc_End
	b _080361E0
	.align 2, 0
_080361D4: .4byte 0x0202BCEC
_080361D8:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_080361E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

