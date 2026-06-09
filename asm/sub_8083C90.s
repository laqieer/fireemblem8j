	.syntax unified
	.set NewMapAnimPoisonAnim2, 0x0807F05C + 1
	.section .text.sub_8083C90, "ax", %progbits
@ sub_8083C90 @ JP 0x08083C90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083C90
	.thumb_func
sub_8083C90:
	push {lr}
	ldr r2, _08083CAC @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl NewMapAnimPoisonAnim2
	pop {r0}
	bx r0
	.align 2, 0
_08083CAC: .4byte 0x0203E1EC

