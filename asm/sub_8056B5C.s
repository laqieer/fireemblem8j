	.syntax unified
	.set AnimClearAll, 0x08004DC0 + 1
	.set BeginAnimsOnBattle_Arena, 0x0805BE4C + 1
	.set CheckBanimHensei, 0x08078730 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8050AD4, 0x08050AD4 + 1
	.set sub_8052E7C, 0x08052E7C + 1
	.set sub_8056C64, 0x08056C64 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.section .text.sub_8056B5C, "ax", %progbits
@ sub_8056B5C @ JP 0x08056B5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056B5C
	.thumb_func
sub_8056B5C:
	push {lr}
	bl sub_805BDCC
	cmp r0, #1
	bne _08056B6C
	bl BeginAnimsOnBattle_Arena
	b _08056BAC
_08056B6C:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08056B7A
	bl BeginAnimsOnBattle_Hensei
	b _08056BAC
_08056B7A:
	bl sub_8050AD4
	bl AnimClearAll
	bl sub_8052E7C
	ldr r1, _08056BB0 @ =0x02017744
	str r0, [r1]
	bl sub_8056C64
	ldr r0, _08056BB4 @ =0x02000000
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, _08056BB8 @ =0x02000010
	str r1, [r0]
	str r1, [r0, #4]
	ldr r0, _08056BBC @ =sub_8056BF0
	bl SetMainUpdateRoutine
	movs r0, #0
	bl SetPrimaryHBlankHandler
_08056BAC:
	pop {r0}
	bx r0
	.align 2, 0
_08056BB0: .4byte 0x02017744
_08056BB4: .4byte 0x02000000
_08056BB8: .4byte 0x02000010
_08056BBC: .4byte 0x08056BF1  @ sub_8056BF0

