	.syntax unified
	.section .text.SetBlendTargetB, "ax", %progbits
@ SetBlendTargetB @ JP 0x08001E5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBlendTargetB
	.thumb_func
SetBlendTargetB:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r6, [sp, #0x14]
	ldr r4, _08001E90 @ =0x0300305C
	mov r8, r4
	ldrh r4, [r4]
	ldr r5, _08001E94 @ =0x0000E0FF
	ands r5, r4
	lsls r0, r0, #8
	lsls r1, r1, #9
	orrs r0, r1
	lsls r2, r2, #0xa
	orrs r0, r2
	lsls r3, r3, #0xb
	orrs r0, r3
	lsls r6, r6, #0xc
	orrs r0, r6
	orrs r5, r0
	mov r0, r8
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001E90: .4byte 0x0300305C
_08001E94: .4byte 0x0000E0FF

