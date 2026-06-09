	.syntax unified
	.set IsValidSuspendSave, 0x080AA7C0 + 1
	.section .text.sub_801C02C, "ax", %progbits
@ sub_801C02C @ JP 0x0801C02C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C02C
	.thumb_func
sub_801C02C:
	push {lr}
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801C03E
	movs r1, #1
_0801C03E:
	adds r0, r1, #0
	pop {r1}
	bx r1

