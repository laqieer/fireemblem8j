	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_800904C, "ax", %progbits
@ sub_800904C @ JP 0x0800904C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800904C
	.thumb_func
sub_800904C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, _08009084 @ =0x085B93D4
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009084: .4byte 0x085B93D4

