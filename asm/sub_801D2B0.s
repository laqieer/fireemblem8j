	.syntax unified
	.set MuExistsActive, 0x0807AB5C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_801D2B0, "ax", %progbits
@ sub_801D2B0 @ JP 0x0801D2B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D2B0
	.thumb_func
sub_801D2B0:
	push {r4, lr}
	adds r4, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D2C4
	adds r0, r4, #0
	bl sub_8002DE4
_0801D2C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

