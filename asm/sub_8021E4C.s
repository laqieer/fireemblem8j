	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8021E4C, "ax", %progbits
@ sub_8021E4C @ JP 0x08021E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021E4C
	.thumb_func
sub_8021E4C:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08021E6A
	bl sub_8000CD8
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08021E86
_08021E6A:
	ldr r2, [r4, #0x34]
	ldr r0, [r4, #0x3c]
	adds r2, r2, r0
	str r2, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x40]
	adds r1, r1, r0
	str r1, [r4, #0x38]
	ldr r0, [r4, #0x2c]
	adds r0, r0, r2
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_08021E86:
	ldr r2, [r4, #0x30]
	cmp r2, #0
	bge _08021E9E
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r1, [r4, #0x14]
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	b _08021EB2
_08021E9E:
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	asrs r2, r2, #0x10
	ldr r3, _08021EBC @ =0x085B8CDC
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0xa
	bl PutSprite
_08021EB2:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021EBC: .4byte 0x085B8CDC

