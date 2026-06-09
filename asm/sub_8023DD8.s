	.syntax unified
	.set sub_80187B0, 0x080187B0 + 1
	.set sub_80290A4, 0x080290A4 + 1
	.section .text.sub_8023DD8, "ax", %progbits
@ sub_8023DD8 @ JP 0x08023DD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023DD8
	.thumb_func
sub_8023DD8:
	push {r4, lr}
	ldr r4, _08023DF8 @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023DF4
	adds r0, r2, #0
	movs r1, #0x21
	bl sub_80187B0
	cmp r0, #0
	bge _08023DFC
_08023DF4:
	movs r0, #3
	b _08023E0E
	.align 2, 0
_08023DF8: .4byte 0x03004DF0
_08023DFC:
	ldr r0, [r4]
	bl sub_80290A4
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _08023E0C
	movs r1, #1
_08023E0C:
	adds r0, r1, #0
_08023E0E:
	pop {r4}
	pop {r1}
	bx r1

