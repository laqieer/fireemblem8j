	.syntax unified
	.set ReadSuspendSave, 0x080AA62C + 1
	.set sub_8009EEC, 0x08009EEC + 1
	.section .text.sub_801C044, "ax", %progbits
@ sub_801C044 @ JP 0x0801C044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C044
	.thumb_func
sub_801C044:
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801C05C
	movs r0, #3
	bl ReadSuspendSave
	bl sub_8009EEC
	movs r0, #0x17
	b _0801C05E
_0801C05C:
	movs r0, #8
_0801C05E:
	pop {r1}
	bx r1
	.align 2, 0

