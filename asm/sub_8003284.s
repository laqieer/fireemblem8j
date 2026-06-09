	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8003284, "ax", %progbits
@ sub_8003284 @ JP 0x08003284 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003284
	.thumb_func
sub_8003284:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08003290 @ =0x02024E68
	movs r3, #0
	b _08003298
	.align 2, 0
_08003290: .4byte 0x02024E68
_08003294:
	adds r3, #1
	adds r2, #0x6c
_08003298:
	cmp r3, #0x3f
	bgt _080032AE
	cmp r2, r4
	beq _08003294
	ldr r1, [r2]
	ldr r0, [r4]
	cmp r1, r0
	bne _08003294
	adds r0, r2, #0
	bl Proc_End
_080032AE:
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

