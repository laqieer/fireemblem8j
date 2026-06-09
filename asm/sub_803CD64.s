	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set sub_803B810, 0x0803B810 + 1
	.section .text.sub_803CD64, "ax", %progbits
@ sub_803CD64 @ JP 0x0803CD64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CD64
	.thumb_func
sub_803CD64:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0803CDA4 @ =0x03004DF0
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl sub_803B810
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CD96
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0
	bl AiSetDecision
_0803CD96:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CDA4: .4byte 0x03004DF0

