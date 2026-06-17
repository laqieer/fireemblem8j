	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8005EA0, "ax", %progbits
@ ApplyGenericChibiPal @ JP 0x08005EA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ApplyGenericChibiPal
	.thumb_func
ApplyGenericChibiPal:
	push {r4, r5, r6, lr}
	sub sp, #0x20
	mov r3, sp
	ldr r2, _08005ED0 @ =0x080DC41C
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5}
	stm r3!, {r4, r5}
	ldr r6, _08005ED4 @ =0xFFFF8100
	adds r0, r0, r6
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005ED0: .4byte 0x080DC41C
_08005ED4: .4byte 0xFFFF8100

