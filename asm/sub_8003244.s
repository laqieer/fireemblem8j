	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8003244, "ax", %progbits
@ sub_8003244 @ JP 0x08003244 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003244
	.thumb_func
sub_8003244:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08003270 @ =0x02024E68
	movs r4, #0
	ldr r5, [r3]
	movs r1, #0x3f
_08003250:
	ldr r0, [r2]
	cmp r0, r5
	bne _08003258
	adds r4, #1
_08003258:
	subs r1, #1
	adds r2, #0x6c
	cmp r1, #0
	bge _08003250
	cmp r4, #1
	bgt _08003274
	ldr r0, [r3, #4]
	adds r0, #8
	str r0, [r3, #4]
	movs r0, #1
	b _0800327C
	.align 2, 0
_08003270: .4byte 0x02024E68
_08003274:
	adds r0, r3, #0
	bl Proc_End
	movs r0, #0
_0800327C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

