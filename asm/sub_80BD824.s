	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetFaceDisplayBits, 0x08005678 + 1
	.set sub_80056AC, 0x080056AC + 1
	.section .text.sub_80BD824, "ax", %progbits
@ sub_80BD824 @ JP 0x080BD824 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD824
	.thumb_func
sub_80BD824:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _080BD8D8 @ =0x08AC10C0
	bl Proc_Find
	adds r7, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0x2c
	mov sb, r0
	movs r1, #1
	mov r8, r1
_080BD85C:
	ldr r0, [r7, #0x2c]
	mov r2, sb
	adds r5, r0, r2
	ldr r4, [r5, #4]
	cmp r4, #0
	beq _080BD8B8
	ldrh r1, [r5, #2]
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080BD8B8
	adds r0, r4, #0
	bl sub_80056AC
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r1, r0
	adds r0, r4, #0
	bl SetFaceDisplayBits
	ldrh r0, [r5, #2]
	ldr r2, _080BD8DC @ =0xFFFFFF00
	adds r1, r2, #0
	ands r0, r1
	adds r0, r0, r6
	strh r0, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #0xa]
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0xfe
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080BD8B8
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
_080BD8B8:
	movs r0, #0xc
	add sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _080BD85C
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD8D8: .4byte 0x08AC10C0
_080BD8DC: .4byte 0xFFFFFF00

