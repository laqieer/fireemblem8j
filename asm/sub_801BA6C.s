	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set PutText, 0x08003DA0 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.section .text.sub_801BA6C, "ax", %progbits
@ sub_801BA6C @ JP 0x0801BA6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BA6C
	.thumb_func
sub_801BA6C:
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801BADC @ =0x080DC6C4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0801BAE0 @ =0x085C2EDC
	bl Proc_Find
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r3, _0801BAE4 @ =0x080DC6E0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl sub_80043B8
	ldr r0, [r6, #0x58]
	movs r1, #7
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl sub_80043B8
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BAE8 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BADC: .4byte 0x080DC6C4
_0801BAE0: .4byte 0x085C2EDC
_0801BAE4: .4byte 0x080DC6E0
_0801BAE8: .4byte 0x02022CA8

