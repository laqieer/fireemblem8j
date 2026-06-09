	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80C5BBC, "ax", %progbits
@ sub_80C5BBC @ JP 0x080C5BBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5BBC
	.thumb_func
sub_80C5BBC:
	push {r4, lr}
	sub sp, #4
	ldr r2, _080C5C10 @ =0x03003020
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	ldr r0, _080C5C14 @ =0x020228A8
	strh r4, [r0]
	bl sub_8001EE4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5C10: .4byte 0x03003020
_080C5C14: .4byte 0x020228A8

