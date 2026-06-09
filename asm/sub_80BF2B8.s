	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002A18, 0x08002A18 + 1
	.set sub_80BD55C, 0x080BD55C + 1
	.set sub_80C1120, 0x080C1120 + 1
	.section .text.sub_80BF2B8, "ax", %progbits
@ sub_80BF2B8 @ JP 0x080BF2B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF2B8
	.thumb_func
sub_80BF2B8:
	push {r4, lr}
	bl sub_8002A18
	ldr r4, _080BF2EC @ =0x08AC1108
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x4c]
	bl sub_80C1120
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	bl sub_80BD55C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF2EC: .4byte 0x08AC1108

