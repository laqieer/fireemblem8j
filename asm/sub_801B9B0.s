	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_801B9B0, "ax", %progbits
@ sub_801B9B0 @ JP 0x0801B9B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B9B0
	.thumb_func
sub_801B9B0:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r0, _0801BA10 @ =0x085C2EDC
	bl Proc_Find
	adds r4, r0, #0
	adds r5, r6, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl sub_8003CF8
	ldr r3, _0801BA14 @ =0x080DC68C
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl sub_80043B8
	ldr r1, _0801BA18 @ =0x085C2EFC
	adds r4, #0x66
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #2
	bl sub_80043B8
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BA1C @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BA10: .4byte 0x085C2EDC
_0801BA14: .4byte 0x080DC68C
_0801BA18: .4byte 0x085C2EFC
_0801BA1C: .4byte 0x02022CA8

