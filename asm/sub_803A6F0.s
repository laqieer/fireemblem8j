	.syntax unified
	.set MuExistsActive, 0x0807AB5C + 1
	.section .text.sub_803A6F0, "ax", %progbits
@ sub_803A6F0 @ JP 0x0803A6F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A6F0
	.thumb_func
sub_803A6F0:
	push {lr}
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0803A702
	movs r0, #0
	b _0803A70A
_0803A702:
	ldr r0, _0803A710 @ =0x03004DF0
	ldr r0, [r0]
	str r1, [r0]
	movs r0, #1
_0803A70A:
	pop {r1}
	bx r1
	.align 2, 0
_0803A710: .4byte 0x03004DF0

