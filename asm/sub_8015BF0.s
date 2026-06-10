	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_8015BF0, "ax", %progbits
@ sub_8015BF0 @ JP 0x08015BF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015BF0
	.thumb_func
sub_8015BF0:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	asrs r4, r4, #0x18
	bl sub_8000CD8
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	cmp r4, #0
	beq _08015C14
	ldr r1, _08015C10 @ =0x085C29BC
	b _08015C16
	.align 2, 0
_08015C10: .4byte 0x085C29BC
_08015C14:
	ldr r1, _08015C34 @ =0x085C29B0
_08015C16:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015C34: .4byte 0x085C29B0

