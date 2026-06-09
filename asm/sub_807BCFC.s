	.syntax unified
	.set sub_801490C, 0x0801490C + 1
	.section .text.sub_807BCFC, "ax", %progbits
@ sub_807BCFC @ JP 0x0807BCFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BCFC
	.thumb_func
sub_807BCFC:
	push {lr}
	ldr r2, [r0, #0x30]
	movs r1, #0
	strh r1, [r2, #0x18]
	ldr r2, [r0, #0x30]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r2, #0x1a]
	ldr r2, _0807BD1C @ =sub_807BD20
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	movs r2, #0x1e
	bl sub_801490C
	pop {r0}
	bx r0
	.align 2, 0
_0807BD1C: .4byte 0x0807BD21  @ sub_807BD20

