	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800D45C, 0x0800D45C + 1
	.set sub_80BD55C, 0x080BD55C + 1
	.set sub_80BD824, 0x080BD824 + 1
	.set sub_80C4FE4, 0x080C4FE4 + 1
	.set sub_80C6D14, 0x080C6D14 + 1
	.set sub_80C7218, 0x080C7218 + 1
	.set sub_80C8418, 0x080C8418 + 1
	.section .text.sub_80BEB4C, "ax", %progbits
@ sub_80BEB4C @ JP 0x080BEB4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEB4C
	.thumb_func
sub_80BEB4C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_800D45C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BEB96
	ldr r2, _080BEB9C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl sub_80BD824
	bl sub_80C8418
	bl sub_80BD55C
	bl sub_80C4FE4
	bl sub_80C7218
	bl sub_80C6D14
	adds r0, r4, #0
	bl sub_8002DE4
_080BEB96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BEB9C: .4byte 0x03003020

