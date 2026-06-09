	.syntax unified
	.set sub_80013FC, 0x080013FC + 1
	.section .text.sub_800DFB0, "ax", %progbits
@ sub_800DFB0 @ JP 0x0800DFB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800DFB0
	.thumb_func
sub_800DFB0:
	push {lr}
	ldr r2, [r0, #0x38]
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	ldrh r1, [r2, #2]
	cmp r0, #0
	bne _0800DFC6
	adds r0, r1, #0
	bl sub_80013FC
_0800DFC6:
	movs r0, #0
	pop {r1}
	bx r1

