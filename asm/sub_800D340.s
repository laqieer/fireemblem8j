	.syntax unified
	.set EnqueueEventCall, 0x0800D2D0 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_800D374, 0x0800D374 + 1
	.section .text.sub_800D340, "ax", %progbits
@ sub_800D340 @ JP 0x0800D340 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D340
	.thumb_func
sub_800D340:
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _0800D360 @ =0x085B98A0
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	bge _0800D364
	adds r0, r5, #0
	adds r1, r4, #0
	bl EnqueueEventCall
	b _0800D36C
	.align 2, 0
_0800D360: .4byte 0x085B98A0
_0800D364:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800D374
_0800D36C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

