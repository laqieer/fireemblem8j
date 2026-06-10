	.syntax unified
	.set IsValidSuspendSave, 0x080AA7C0 + 1
	.section .text.sub_801BFB8, "ax", %progbits
@ sub_801BFB8 @ JP 0x0801BFB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BFB8
	.thumb_func
sub_801BFB8:
	push {lr}
	movs r0, #4
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801BFCA
	movs r1, #1
_0801BFCA:
	adds r0, r1, #0
	pop {r1}
	bx r1

