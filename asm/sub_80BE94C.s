	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.set sub_80BD55C, 0x080BD55C + 1
	.set sub_80BD824, 0x080BD824 + 1
	.set sub_80C8418, 0x080C8418 + 1
	.section .text.sub_80BE94C, "ax", %progbits
@ sub_80BE94C @ JP 0x080BE94C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE94C
	.thumb_func
sub_80BE94C:
	push {lr}
	movs r0, #4
	bl sub_800226C
	ldr r2, _080BE984 @ =0x03003020
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
	pop {r0}
	bx r0
	.align 2, 0
_080BE984: .4byte 0x03003020

