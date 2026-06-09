	.syntax unified
	.section .text.SetBlendTargetA, "ax", %progbits
@ SetBlendTargetA @ JP 0x08001E20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBlendTargetA
	.thumb_func
SetBlendTargetA:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r6, [sp, #0x14]
	ldr r4, _08001E54 @ =0x0300305C
	mov r8, r4
	ldrh r5, [r4]
	ldr r4, _08001E58 @ =0x0000FFE0
	ands r4, r5
	lsls r1, r1, #1
	orrs r1, r0
	lsls r2, r2, #2
	orrs r2, r1
	lsls r3, r3, #3
	orrs r3, r2
	lsls r6, r6, #4
	orrs r6, r3
	orrs r4, r6
	mov r0, r8
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001E54: .4byte 0x0300305C
_08001E58: .4byte 0x0000FFE0

