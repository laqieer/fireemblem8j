	.syntax unified
	.set AddGmPath, 0x080C16FC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_800C43C, "ax", %progbits
@ sub_800C43C @ JP 0x0800C43C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C43C
	.thumb_func
sub_800C43C:
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r2, [r0, #4]
	ldr r0, _0800C468 @ =0x03005270
	adds r1, r0, #0
	adds r1, #0xa4
	bl AddGmPath
	ldr r0, _0800C46C @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800C468: .4byte 0x03005270
_0800C46C: .4byte 0x08AC1108

