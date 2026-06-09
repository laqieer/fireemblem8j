	.syntax unified
	.set Sound_SetDefaultMaxNumChannels, 0x08002820 + 1
	.set sub_8002838, 0x08002838 + 1
	.section .text.sub_800284C, "ax", %progbits
@ sub_800284C @ JP 0x0800284C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800284C
	.thumb_func
sub_800284C:
	push {lr}
	cmp r0, #0x40
	beq _0800286C
	cmp r0, #0x40
	bgt _08002860
	cmp r0, #2
	bgt _08002884
	cmp r0, #1
	blt _08002884
	b _0800286C
_08002860:
	cmp r0, #0x42
	blt _08002884
	cmp r0, #0x43
	ble _0800286C
	cmp r0, #0x74
	bne _08002884
_0800286C:
	ldr r0, _08002880 @ =0x02024E5C
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #8
	beq _08002896
	movs r0, #8
	bl sub_8002838
	b _08002896
	.align 2, 0
_08002880: .4byte 0x02024E5C
_08002884:
	ldr r0, _0800289C @ =0x02024E5C
	movs r1, #8
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08002896
	bl Sound_SetDefaultMaxNumChannels
_08002896:
	pop {r0}
	bx r0
	.align 2, 0
_0800289C: .4byte 0x02024E5C

